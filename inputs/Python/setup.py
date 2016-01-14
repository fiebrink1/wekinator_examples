#!/usr/bin/env python

from distutils.core import setup

import OSC

setup(name='pyOSC',
	version="%s.%s-%s" % OSC.version,
	description='Simple OpenSoundControl module in Pure Python',
	long_description="""Simple OpenSoundControl module in Pure Python. Replaces the 'SimpleOSC' module.
  This implementation is intended to still be 'Simple' to the user, but much more complete
  (with OSCServer & OSCClient classes) and much more powerful
  (the OSCMultiClient supports subscriptions & message-filtering,
  OSCMessage & OSCBundle are now proper container-types)
This is a 'Pure Python' implementation, intended to be simple and transparent.
  If you ar looking for a FAST OSC-implementaion, try the 'pyliblo' package""",
	author='Stock',
	author_email='stock@v2.nl',
	url='http://trac.v2.nl/wiki/pyOSC',
	download_url='http://trac.v2.nl/wiki/pyOSC',
	license='GNU Lesser General Public License',
	py_modules=['OSC'],
	obsoletes=['SimpleOSC'],
	keywords=['OSC', 'OpenSoundControl'],
	classifiers=[
		'Development Status :: 4 - Beta',
		'Intended Audience :: Developers',
		'Intended Audience :: Science/Research',
		'License :: OSI Approved :: GNU Library or Lesser General Public License (LGPL)',
		'Operating System :: OS Independent',
		'Programming Language :: Python',
		'Topic :: Artistic Software',
		'Topic :: Communications',
		'Topic :: Other/Nonlisted Topic',
		'Topic :: Scientific/Engineering :: Human Machine Interfaces',
		'Topic :: Scientific/Engineering :: Interface Engine/Protocol Translator',
		'Topic :: Software Development :: Libraries',
		'Topic :: System :: Networking',
	]
)