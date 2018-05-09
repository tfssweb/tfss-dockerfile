#!/usr/bin/env python
# -*- coding: utf-8 -*-

from sys import argv, exit
import re
from glob import glob
from urllib import urlopen, urlretrieve
from shutil import move
from os import remove, path

try:
    from bs4 import BeautifulSoup as Soup
except ImportError:
    Soup = None
    exit("""You need beautifulsoup4!
                install it from https://www.crummy.com/software/BeautifulSoup/
                or run pip install beautifulsoup4.""")

centos_version = '7.4.1708'

docker_repo = 'https://mirrors.aliyun.com/docker-ce/linux/centos/7/x86_64/stable/Packages/'
docker_compose_repo = 'https://github.com/docker/compose/releases'
rep_mirror_url = 'https://mirrors.aliyun.com/centos'
package_local = {'common': './packages/common/',
                 'docker': './packages/'}

docker_require_packages = ['audit-libs-python',
                           'libsemanage-python',
                           'libtool-ltdl',
                           'container-selinux',
                           'libcgroup',
                           'libseccomp',
                           'python-IPy',
                           'checkpolicy',
                           'policycoreutils-python',
                           'setools-libs'
                           ]


def get_download_docker_require_packages_urls(cent_os_version):
    os_repo = ('%s/%s/os/x86_64/Packages/' % (rep_mirror_url, cent_os_version))
    os_repo_soup = Soup(urlopen(os_repo), "html.parser")

    def is_match_package_name(package_name, href_str):
        return re.match(package_name + '-\d+.+(x86_64|noarch)\.rpm', href_str)

    arr = docker_require_packages[:]

    def is_starts_with_in_array_items(s):
        return any([is_match_package_name(x, s) for x in arr])

    def to_version(s):
        m = re.search('\d+.+-\d', s)
        return re.sub('[.-]', '', m.group(0))

    os_tags = os_repo_soup.find_all('a', text=is_starts_with_in_array_items)

    hrefs = [tag.get('href') for tag in os_tags]
    href_set = set(hrefs)

    for n in docker_require_packages:
        for os_href in href_set:
            if is_match_package_name(n, os_href):
                arr.remove(n)
                continue

    def add_extra_package_href():
        extras_repo = ("%s/%s/extras/x86_64/Packages/" % (rep_mirror_url, cent_os_version))
        extras_repo_soup = Soup(urlopen(extras_repo), "html.parser")
        extra_tags = extras_repo_soup.find_all('a', text=is_starts_with_in_array_items)

        for ss in arr:
            extra_package_href = None
            for ext_tag in extra_tags:
                if is_match_package_name(ss, ext_tag.get('href')):
                    if extra_package_href is None:
                        extra_package_href = ext_tag.get('href')
                    else:
                        cv = to_version(ext_tag.get('href'))
                        ov = to_version(extra_package_href)
                        if cv > ov:
                            extra_package_href = ext_tag.get('href')

            if extra_package_href is not None:
                href_set.add(extras_repo + extra_package_href)

    if len(arr) > 0:
        add_extra_package_href()

    arr = []

    if len(href_set) > 0:
        for href in href_set:
            full_href = href
            if not href.startswith('http'):
                full_href = os_repo + href
            arr.append(full_href)
    return arr


def get_simplify_package_name(s):
    return re.search('([^\d]+)-', s).group(0)[:-1]


def get_exist_common_files():
    a = glob(package_local['common'] + "*.rpm")
    names = [s[s.rfind('/') + 1:] for s in a]
    return {get_simplify_package_name(s): s for s in names}


def update_local_package(fileurl, filename, filedir, old_filename=None, is_remove_old_file=True):
    if path.isfile(filename):
        remove(filename)
    urlretrieve(fileurl, filename)
    if path.isfile(filedir + filename):
        remove(filedir + filename)
    move(filename, filedir)
    if old_filename is not None and is_remove_old_file and path.isfile(filedir + old_filename):
        remove(filedir + old_filename)


def get_download_docker_packages_urls():
    soup = Soup(urlopen(docker_repo), "html.parser")

    tags = soup.find_all('a', text=re.compile('docker-ce-\d+.+x86_64.rpm'))
    hrefs = [tag.get('href') for tag in tags]
    href_set = set(hrefs)

    return href_set


def clean_local_package_by_prefix(filedir, prefix, suffix='*.rpm'):
    exist_packages = glob(filedir + suffix)
    names = [exist_package[exist_package.rfind('/') + 1:] for exist_package in exist_packages]
    for old_package in names:
        if old_package.startswith(prefix):
            remove(filedir + old_package)


def update_docker_require_packages(cent_os_version):
    package_hrefs = get_download_docker_require_packages_urls(cent_os_version)

    if len(package_hrefs) == 0:
        return False

    # key: package name, value: package download url
    package_dict = {}

    for href in package_hrefs:
        package_dict[href[href.rfind('/') + 1:]] = href

    exist_commons_dict = get_exist_common_files()

    for k, v in package_dict.items():
        if k not in exist_commons_dict.values():
            old_file = exist_commons_dict[get_simplify_package_name(k)]
            print ('%s latest version is available: %s' % (old_file, k))
            update_local_package(v, k, package_local['common'], old_file)


def update_docker():
    hrefs = get_download_docker_packages_urls()

    def to_version(s):
        m = re.search('\d+.+-', s)
        return re.sub('[.-]', '', m.group(0))[:-2]

    latest_package = None
    for href in hrefs:
        cv = to_version(href)
        if latest_package is None or cv > to_version(latest_package):
            latest_package = href

    if path.isfile(package_local['docker'] + latest_package):
        print('latest version %s was existed' % latest_package)

        return False

    clean_local_package_by_prefix(package_local['docker'], 'docker-ce-')
    update_local_package(docker_repo + latest_package, latest_package, package_local['docker'])


def update_docker_compose():
    package_url_pattern = 'https://github.com/docker/compose/releases/download/%s/docker-compose-Linux-x86_64'
    soup = Soup(urlopen(docker_compose_repo), "html.parser")
    title_tags = soup.select('.release-header h1 a')
    versions = [title_tag.text for title_tag in title_tags]
    version_set = set([s for s in versions if 'rc' not in s])

    filename = 'docker-compose-Linux-x86_64-' + max(version_set)
    if path.isfile(package_local['docker'] + filename):
        print('latest version %s was existed' % filename)
        return False

    url = package_url_pattern % max(version_set)

    clean_local_package_by_prefix(package_local['docker'], 'docker-compose-Linux-x86_64', '*')
    update_local_package(url, filename, package_local['docker'])


if __name__ == '__main__':
    update_docker_require_packages(centos_version)
    print('update docker require packages was done.')
    update_docker()
    print('update docker-ce was done.')
    update_docker_compose()
    print('update docker-compose was done.')
