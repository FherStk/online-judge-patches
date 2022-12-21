# online-judge-patches
Patches for customizing our local DMOJ instance

# How to use it
1. Create a new folder setting as its name the last dmoj's online-judge commit date.

2. Make a copy of the production dmoj's online-judge instance into the local host, for example: `scp -r root@dmoj-prod:/etc/dmoj/site /home/fher/repos/dmoj/online-judge-elpuig`

3. Opening the folder with Visual Studio Code will prompt every customized file as commit pending changes.

4. Run a diff command for every file or folder within online-judge that has been customized, for example: `diff -Nur online-judge-dmoj/templates/problem/problem.html online-judge-elpuig/templates/problem/problem.html > online-judge-patches/2022-12-20/templates_problem.txt`

5. The folder created at the first step contains all the customization done into the production dmoj's online-judge instance.

