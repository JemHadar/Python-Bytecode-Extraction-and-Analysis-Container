# Python Bytecode Extraction and Analysis Container
 To make it easier for anyone to extract python-byte code from a Windows binary which was packed with either py2exe or pyinstaller, I created this docker container. 

 A walkthrough below will also show that the best method in this scenario would be to first determine which python utility was used and then proceed with the byte-code extraction and subsequent disassembly.
 
[![Video Walkthrough](https://img.youtube.com/vi/Hva1x4D2Ly4/0.jpg)](https://www.youtube.com/watch?v=Hva1x4D2Ly4 "Walkthrough") 


 The files to instantiate the container are the shell script and the dockerfile. When the shell script is executed, it will automatically create the docker image, install the necessary tools, and run the container transferring the file to be analyzed to our directory in the container.

 When the shell script is intially executed, it may take 5 minutes give or take, depending on the speed of your internet connection and CPU for the docker image creation to complete. This is because when the image is bein built, the tools are being downloaded to the base image, setting the path variable, soft links and cleanup. One of the packages also is being compiled and installed from source so please be patient. Once the image is built, the execution of the container will take mere seconds for all subsequent containers since the base image is already built and cached.

 The following tools are installed:
 
 -Decompyle++
 
 -pyinstxtractor
 
 -Detect it Easy (DIEC)
 
 -uncompyle6
 
 -decompile3
 
 -pyc2bytecode
 
 -unpy2exe
 
 -hexviewer
 
 -Floss
 
 -Capa

** To install docker, please follow the prerequisites outlined in MalDocAnalysis Container  [MalDocAnalysis Container](https://github.com/JemHadar/MalDocAnalysisContainer)**

 A big thank you to the authors of the tools below:

 Decompyle++
 
 https://github.com/zrax/pycdc

 pyinstxtractor
 
 https://github.com/extremecoders-re/pyinstxtractor

 uncompyle6
 
 https://github.com/rocky/python-uncompyle6

 decompile3
 
 https://github.com/rocky/python-decompile3/tree/master

 pyc2bytecode
 
 https://github.com/knight0x07/pyc2bytecode

 unpy2exe
 
 https://github.com/matiasb/unpy2exe

 Mandiat Floss
 
 https://github.com/mandiant/flare-floss

 Mandiant CAPA
 
 https://github.com/mandiant/capa
 https://www.mandiant.com/resources/blog/capa-automatically-identify-malware-capabilities
 
 DIE
 https://github.com/horsicq/Detect-It-Easy
