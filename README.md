# online-judge-patches
Patches for customizing our local DMOJ instance

# How to use it
0. Setup the project folders as:
  - dmoj
    - online-judge-patches (this project)
    - online-judge-source  (the original one)
    - online-judge-custom  (the custom one)

1. Create a new folder setting as its name the last dmoj's online-judge commit date. *Important*: all the commands will be launched from the current project root folder (online-judge-patches/).

2. Make a copy of the production dmoj's online-judge instance into the local host, for example: `scp -r root@dmoj-prod:/etc/dmoj/site ../online-judge-custom`

3. Opening the folder with Visual Studio Code will prompt every customized file as commit pending changes.

4. Run a diff command for every file or folder within online-judge that has been customized, for example: `diff -Nur ../online-judge-source/templates/problem/problem.html ../online-judge-custom/templates/problem/problem.html > 2022-12-20/templates_problem.txt`

5. The folder created at the first step contains all the customization done into the production dmoj's online-judge instance.

6. Edit the file `patch.sh` and setup the `PATCH` var with the newly created folder name.

7. Run the `patch.sh` script: `./patch.sh`