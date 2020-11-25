## twitterdata2feeder
this is a small bash script that creates a ***feeder.opml*** file from your [twitter data](https://help.twitter.com/en/managing-your-account/how-to-download-your-twitter-archive), which you can then import into the [feeder app](https://gitlab.com/spacecowboy/Feeder). It uses the rss feed function from [nitter](https://nitter.net/) with wich you can create a rss feed from every public twitter account.

#### Dependencies:
for this script to work you need the following things:
- the unzip package installed on your mashine 
    - for ubuntu/debian <code>sudo apt install unzip</code>
- a download of your [twitter data](https://help.twitter.com/en/managing-your-account/how-to-download-your-twitter-archive) as "*.zip*"
- a working internet connection

also you will need to install the [feeder app](https://gitlab.com/spacecowboy/Feeder) on your mobile phone. Without it this script is somewhat useless. 

#### Usage:
under linux:<br />
if the script <code>makeFeederImport.sh</code> is not executable, make it executable with <code>chmod a+x makeFeederImport.sh</code><br />
then execute it with <code>./makeFeederImport.sh</code><br />
copy the *feeder.opml* to your smartphone and import it into the [feeder app](https://gitlab.com/spacecowboy/Feeder)
