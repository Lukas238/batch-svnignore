#batch-svnignore

Batch script to automatically configure the SVN global-ignores property in order to ignore folders and files.


##How To:

1. This go to a folder where you want to ignore some folders. Ex.: **C:\project\src**
2. Create an text file with the name: "**.svnignore**".
	**Tip**:  Windows will not let you create this file directly. Instead I create it from a text editor.
3. Open the file and list all the folders and files you want to ignore.  
	**All files and folder must be in the same depth as the .svnignore file.**   
4. Repeat the step 1 to 3 for each folder with files and folders to ignore.
5. Run the batch file **svnignore.bat** on the project top folder.

The script will look recursively in all project folders for any .svnignore configuration file, and will apply in SVN  the ignore settings in each folder.

### .svnignore example

**File**: C:\project\src\\.svnignore
```
.sass-cache
node_modules
dev
```


##Requirements:

###SVN command line client tools

Verify you have installed svn with the below command:

```
$	svn
```
If the command returns an error, it is probably due to the **SVN command line tools** were not installed .

####Solutions:

#####Option A: Tortoise SVN
If you have installed TortoiseSVN, rerun the installer and make sure to select the second option: _"command line client tools"_.

![](images/ZquvH.png?raw=true)

#####Option B: Install SVN
Download and run the [SVN] installer.


##Limitations
Any previous settings in the global-ignores of each folder will be eliminated by the script.


[SVN]: http://sourceforge.net/projects/win32svn/

