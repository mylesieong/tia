# SMS Foxpro middleware refactor to java desktop application

BCM sends its sms to CTM ftp using a foxpro program. Firstly, as400 pgm push the sms content to output queue, then somehow the output queue shoot these sms content to a network drive, the foxpro then uploads whatever appears in the network drive to CTM ftp.

Since no maintenance can be performed on this foxpro program, this project aims to create an equivalent java program so that we can "control" this program again. 

The source code is place at the git repo: send-sms-ftp
