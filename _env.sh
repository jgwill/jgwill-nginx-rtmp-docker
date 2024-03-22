ctlid=2403210842
dockertag=jgwill/server:rtmp

containername=rtmp
dkhostname=$containername

# PORT
dkport=1935:1935

xmount=/b/Dropbox/aellia/ast/traintest240312/tmp:/out
#xmount2=/var:/a/var

#CMD ["nginx", "-g", "daemon off;"]
#dkcommand="nginx -g 'daemon off;' " #command to execute (default is the one in the dockerfile)
#dkcommand=bash #command to execute (default is the one in the dockerfile)

dkextra="  -v $(pwd)/img:/img -p 8080:8080 "
#dkextra=" -v \$dworoot/x:/x -p 2288:2288 "

#dkmounthome=true


##########################
############# RUN MODE
#dkrunmode="bg" #default fg
#dkrestart="--restart" #default
#dkrestarttype="unless-stopped" #default


#########################################
################## VOLUMES
#dkvolume="myvolname220413:/app" #create or use existing one
#dkvolume="$containername:/app" #create with containername name



#dkecho=true #just echo the docker run


# Use TZ
#DK_TZ=1



#####################################
#Build related
#
##chg back to that user
#dkchguser=vscode

######################## HOOKS BASH
### IF THEY EXIST, THEY are Executed, you can change their names

dkbuildprebuildscript=dkbuildprebuildscript.sh
dkbuildbuildsuccessscript=dkbuildbuildsuccessscript.sh
dkbuildfailedscript=dkbuildfailedscript.sh
dkbuildpostbuildscript=dkbuildpostbuildscript.sh

###########################################
# Unset deprecated
unset DOCKER_BUILDKIT

