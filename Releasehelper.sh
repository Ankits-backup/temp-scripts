echo "HI WELCOME TO PixelBlasterOS RELEASE SCRIPT"
echo ########################
echo "WHAT YOU WANT DO  CHOOSE FROM BELOW OPTION"
echo "1 INSTALL CLI CLIENT"
echo "2 RELEASE A BUILD"
#echo Enter number infront option to continuee
read -p 'ENTER OPTION : ' option
if(($option == 1))
        then
                echo "CLI CLIENT IS INSTALLING"
                sudo apt-get install -y dirmngr
                curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg
                echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
                sudo apt update
                sudo apt install -y  gh
                echo "installtion completed."
elif(($option == 2))
        then
                echo "TIME TO RELEASEE"
                echo "Please provide following details"
                read -p 'Release tag eg v1.0 : ' Rtag
                read -p 'Enter file name eg xyz-v3.0.zip : ' filename
                read -p 'File path eg out/rom.zip : ' Rzippath
                read -p 'GITHUB TOKEN : ' gtoken
                read -p 'Link to clone repo of your device : ' clink
                read -p 'Device Name (code name) : ' devicename
                mkdir upload
                cp $Rzippath upload
                cd upload
                git init
                git remote add origin $clink
                fname="PixelBlasterOS $Rtag | $devicename"
                export GITHUB_TOKEN=$gtoken
                gh release create "$Rtag" "$filename" -t "$fname"
                echo "BUILDUPLOADED HOPEFULLY"
                echo "DELTEING FILES CREATED BY SCRIPT"
                cd .. #just to go back to clear working directory
                sudo rm -rf upload
                echo "done clearing"
                echo "DONE FILE UPLOAD THIS IS SCRIPT SO IF FAILED THE ISSUE USER SIDE"
fi
echo see you sooon
