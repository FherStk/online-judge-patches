# online-judge-patches
Patches for customizing our local DMOJ instance.

# How to use it
1. Setup the project folders as:
  - dmoj
    - online-judge-patches (this project: `git clone https://github.com/FherStk/online-judge-patches.git`)
    - online-judge-custom  (our customized code: `git clone https://github.com/FherStk/online-judge.git online-judge-custom`)
    - online-judge-production (our production code: `rsync -azP root@dmoj-prod:/etc/dmoj/site/ online-judge-production`)

2. Within the `online-judge-patches` path, create a new folder using the current date as the name. *Important*: all the commands will be launched from the current folder (online-judge-patches/).

3. Opening the `online-judge-production` project with Visual Studio Code will prompt every customized file as commit pending changes to the 'custom' repo (fetch needed). The idea is mantain the 'custom' repo updated with the 'source' repo (the original DMOJ one) sending some pull-requests. But sometimes, a bit of customization is needed in production (for example, to avoid the wevent error).

4. Files can be ignored locally adding entries with `nano .git/info/exclude`.

5. At `online-judge-patches`, run a diff command for every file or folder within online-judge that has been customized, for example: `diff -Nur ../online-judge-custom/templates/problem/problem.html ../online-judge-production/templates/problem/problem.html > 2022-12-20/templates_problem.txt`

6. Review the patch files, because could include custom changes and also legit updates; if so, remove the legit updates (remote changes).

7. The folder created at the first step contains all the customization done into the production dmoj's online-judge instance.

8. Edit the file `patch.sh` and setup the `PATCH` var with the newly created folder name.

9. Run the `patch.sh` script: `./patch.sh`

10. At this point, the project folder should contain the following:
  - dmoj
    - online-judge-patches        (this project)
    - online-judge-custom         (the custom code)    
    - online-judge-production     (the production code, is the custom code with the patches applied)  
    - online-judge-production.backup  (the original production code)

11. Opening the `online-judge-production` project with Visual Studio Code should prompt every customized file as commit pending changes. Review it and fix it if needed.

12. Copy the patched version from the local host to the production host with: `rsync -azP ../online-judge-production/ root@dmoj-prod:/etc/dmoj/site`

13. Connect to the production host and:
  - Go to the installation folder: `cd /etc/dmoj`
  - Activate the virtualhost: `. dmojsite/bin/activate`
  - Go to the online-judge folder: `cd site`
  - Perform the migrations: `python3 manage.py migrate`
  - Compilte the CSS styles and setup static files: 
    ```
    ./make_style.sh
    python3 manage.py collectstatic
    python3 manage.py compilemessages
    python3 manage.py compilejsi18n
    ```
  - If needed, upgrade the dmoj judge service: `pip3 install --upgrade dmoj`
  - Restart the server and test: `sudo reboot`
