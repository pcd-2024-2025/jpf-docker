PCD a.y. 2024-2025 - ISI LM UNIBO - Cesena Campus

## JPF Lightweight Environment - Docker version

This is a customised lightweight environment to work with JPF (Java Path Finder), based on Docker.  It requires **docker** to be installed locally (but it does not require JDK 8).

- Open a shell/terminal and change the path to this repo (referred here as `jpf-docker`)
- To build the image:  

  `jpf-docker> docker build -t jpf-container .`

  This will build an image with JDK 8 copying inside JPF binaries, using the `Dockerfile` available in the repo. Inside the container all the JPF environment is placed in a directory called `jpf-workspace`, assumed as work directory.

- To run the container:

  `jpf-docker> docker run -it --rm -v $(pwd)/.:/jpf-workspace jpf-container`

  This will run the container mounting the current directory (`jpf-docker`) so as to make local files (Java sources, *.jpf files, binaries) accessible from the toolchain in the container (`javac` and `java`). 

- From inside the container, create a `bin` directory:
	
	`jpf-workspace> mkdir bin`

  (if the command fails because the directory is already present, it is ok)
  
- From inside the container, to compile sources in the local `src` directory:

  	`jpf-workspace> javac -classpath JPF/build/jpf-classes.jar -d bin <java src files>`  
	
	Example:  

	`jpf-workspace> javac -classpath JPF/build/jpf-classes.jar -d bin src/pcd/lab02/jpf/*.java`

- Still from inside the container, to run JPF - two options:

	- using a *.jpf file:  
  
		`jpf-workspace> java -jar JPF/build/RunJPF.jar <JPF file>`

		Example:

		`jpf-workspace> java -jar JPF/build/RunJPF.jar TestScenarios.jpf`

	- specifying the main class:  

		`jpf-workspace> java -jar JPF/build/RunJPF.jar +classpath=bin <Java main class>`

		Example

		`jpf-workspace> java -jar JPF/build/RunJPF.jar +classpath=bin pcd.lab02.jpf.TestLostUpdate `

  


