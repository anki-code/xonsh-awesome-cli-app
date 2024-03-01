#!/usr/bin/env python

import setuptools

try:
    with open('README.md', 'r', encoding='utf-8') as fh:
        long_description = fh.read()
except (IOError, OSError):
    long_description = ''

setuptools.setup(
    name='xonsh-awesome-cli-app',
    version='0.1.0',
    license='BSD',
    author='anki-code',
    author_email='author@example.com',
    description="Example of awesome CLI app template for xonsh.",
    long_description=long_description,
    long_description_content_type='text/markdown',
    python_requires='>=3.6',
    install_requires=['xonsh', 'click'],
    scripts=['mycli'],
    packages=setuptools.find_packages(),
    package_data={'xonsh_awesome_cli_app': ['*.py', '*.xsh']},
    platforms='any',
    url='https://github.com/anki-code/xonsh-awesome-cli-app',
    project_urls={
        "Documentation": "https://github.com/anki-code/xonsh-awesome-cli-app/blob/master/README.md",
        "Code": "https://github.com/anki-code/xonsh-awesome-cli-app",
        "Issue tracker": "https://github.com/anki-code/xonsh-awesome-cli-app/issues",
    },
    classifiers=[
        "License :: OSI Approved :: BSD License"
    ]
)
