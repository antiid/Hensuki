#!/bin/bash
#sin

RED=$(tput setaf 1) 
GREEN=$(tput setaf 2) 
CYAN=$(tput setaf 6) 
WHITE=$(tput setaf 7) 
begin=$(date +"%s")
echo -e "${RED} "
echo "  Sin . (Hensuki [bash simply-hentai.com downloader])"
echo "${GREEN}"
echo "usage : ['artwork']/['series']/[all-pages]"
echo "${WHITE}"
echo "ie: https://www.simply-hentai.com/original-work/kawaisou-na-ko-shiawase-na-ko"
echo "just type: ${CYAN}original-work/kawaisou-na-ko-shiawase-na-ko/all-pages"
#get
echo "code:"
read -r kode
echo -e "reading /${GREEN}$kode ..
${WHITE}"
meki="cat meki.html"

wget -O meki.html https://www.simply-hentai.com/${kode};

#do
mkdir -pv "${kode}" 
echo -e "still doing for /${GREEN}$kode ...
${WHITE}"
${meki} | grep -Po 'full":"\K[^"]+' > ${kode}/asu.txt #dog
cd ${kode};
wget -q -nv -i asu.txt # --user-agent="Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36"
rm asu.txt
# option -i $argv if necessary show dat process
cd $OLDPWD
rm meki.html;

#length
termin=$(date +"%s")
difftimelps=$(($termin-$begin))
echo "${WHITE}$(($difftimelps / 60)) minutes and $(($difftimelps % 60)) sec. elapsed ${RED}simplynetwork stealer"