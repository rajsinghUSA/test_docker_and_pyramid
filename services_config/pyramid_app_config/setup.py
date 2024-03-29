import os

from setuptools import setup, find_packages

here = os.path.abspath(os.path.dirname(__file__))
#README = open(os.path.join(here, 'README.txt')).read()
#CHANGES = open(os.path.join(here, 'CHANGES.txt')).read()

requires=['pyramid>=1.4',
          'pyramid_jinja2',
          'jinja2',
          'jinja2_alchemy_starter',
          'sqlalchemy',
          'waitress',
          'pyramid_tm',
          'pyramid_debugtoolbar',
          'pyramid_mailer',
          'pyramid_redis_sessions',
          'zope.sqlalchemy']

setup(name='testsite',
      version='0.0',
      description='testsite',
#      long_description=README + '\n\n' +  CHANGES,
      classifiers=[
        "Programming Language :: Python",
        "Framework :: Pylons",
        "Topic :: Internet :: WWW/HTTP",
        "Topic :: Internet :: WWW/HTTP :: WSGI :: Application",
        ],
      author='',
      author_email='',
      url='',
      keywords='web pyramid pylons',
      packages=find_packages(),
      include_package_data=True,
      zip_safe=False,
      install_requires=requires,
      tests_require=requires,
      test_suite="testsite",
      entry_points = """\
      [paste.app_factory]
      main = testsite:main
      """,
      paster_plugins=['pyramid'],
      )
