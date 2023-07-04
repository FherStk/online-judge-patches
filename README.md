# online-judge-patches
Patches for customizing our local DMOJ instance

# How to use it
0. Setup the project folders as:
  - dmoj
    - online-judge-patches (this project: `git clone https://github.com/FherStk/online-judge-patches.git`)
    - online-judge-source  (the original one: `git clone https://github.com/DMOJ/online-judge.git online-judge-source`)
    - online-judge-custom  (the custom one: it will be copied from source)

1. Within the `online-judge-patches` path, create a new folder using the current date as the name. *Important*: all the commands will be launched from the current folder (online-judge-patches/).

2. Make a copy of the production dmoj's online-judge instance into the local host, for example: `rsync -azP root@dmoj-prod:/etc/dmoj/site/ ../online-judge-custom`

3. Opening the `online-judge-custom` project with Visual Studio Code will prompt every customized file as commit pending changes (git fetch needed).

4. At `online-judge-patches`, run a diff command for every file or folder within online-judge that has been customized, for example: `diff -Nur ../online-judge-source/templates/problem/problem.html ../online-judge-custom/templates/problem/problem.html > 2022-12-20/templates_problem.txt`

5. Review the patch files, because could include custom changes and also legit updates; if so, remove the legit updates (remote changes).

6. The folder created at the first step contains all the customization done into the production dmoj's online-judge instance.

7. Edit the file `patch.sh` and setup the `PATCH` var with the newly created folder name.

8. Run the `patch.sh` script: `./patch.sh`

9. At this point, the project folder should contain the following:
  - dmoj
    - online-judge-patches        (this project)
    - online-judge-source         (the original one)
    - online-judge-custom         (the patched custom one)
    - online-judge-custom.backup  (the original custom one)

10. Opening the `online-judge-custom` project with Visual Studio Code should prompt every customized file as commit pending changes. Review it and fix it if needed.

11. Copy the patched version from the local host to the production host with: `rsync -azP ../online-judge-custom/ root@dmoj-prod:/etc/dmoj/site`

12. Connect to the production host and:
  - Go to the installation folder: `cd /etc/dmoj`
  - Activate the virtualhost: `. dmojsite/bin/activate`
  - Go to the online-judge folder: `cd site`
  - Perform the migrations: `python3 manage.py migrate`
  - Restart the service and test.
