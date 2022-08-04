if [ ${{inputs.showall}} == 'yes' ];then showall="-a " ;else showall="" ;fi
if [ ${{inputs.showdirectoryname}} == 'yes' ];then showdirectoryname="-d " ;else showdirectoryname="" ;fi
if [ ${{inputs.showchangetime}} == 'yes' ];then showchangetime="-D " ;else showchangetime="" ;fi
if [ ${{inputs.showsize}} == 'yes' ];then showsize="-s " ;else showsize="" ;fi
if [ ${{inputs.showallname}} == 'yes' ];then showallname="-f " ;else showallname="" ;fi
if [ ${{inputs.ignoregit}} == 'yes' ];then tree ${showall}${showdirectoryname}${showchangetime}${showsize}${showallname}-I ".git" > ./tree.bak ;else tree ${showall}${showdirectoryname}${showchangetime}${showsize}${showallname} > ./tree.bak ;fi
        
echo "tree ${showall}${showdirectoryname}${showchangetime}${showsize}${showallname}${ignoregit} > ./tree.bak"
