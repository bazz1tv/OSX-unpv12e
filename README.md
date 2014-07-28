OSX-unpv12e
===========

OSX Port of Stevens' UNIX Network Programming Volume 1 2nd Ed. Source Code. a WIP

I learned a lot from this book even though it's 16 years old. Particularly, adding reliability to UDP. What I want you to understand from this Github repo ATM, is that all the examples do not work, for various reasons, namely: 

XTI seems to be unsupported and ancient dead stuff. So we don't bother trying to touch that stuff in Stevens' source.

Next, some things that compile do not work -- namely ping. 

Like I said, once I got the projects to compile, and I could work with the UDP examples I needed (rtt, udpcliserv) I was happy. That means I have not tested anything else. You should be cautious and if you have the brains to make something work that doesn't already, please submit a pull request and I will get your code in here. 

Tested and Working
==================
rtt
udpcliserv
