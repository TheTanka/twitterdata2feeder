## twitterdata2feeder
this is a small bash script that creates a ***feeder.opml*** file from your [twitter data](https://help.twitter.com/en/managing-your-account/how-to-download-your-twitter-archive), which you can then import into the [feeder app](https://gitlab.com/spacecowboy/Feeder).

#### Dependencies:
for this script to work you need the following things:
- the unzip package installed on your mashine 
    - for ubuntu/debian sudo apt install unzip
- a download of your [twitter data](https://help.twitter.com/en/managing-your-account/how-to-download-your-twitter-archive) as "*.zip*"

also you will need to install the [feeder app](https://gitlab.com/spacecowboy/Feeder) on your mobile phone. Without it this script is somewhat useless. 

#### Usage:
under linux:

if the script <code>makeFeederImport.sh</code> is not executable, make it executable with <code>chmod a+x makeFeederImport.sh</code>
the execute it with <code>./makeFeederImport.sh</code>

