rm -rf maechtekongresse-master && rm master.zip
rm -rf data/editions && rm -rf data/indices && rm -rf data/meta
wget https://github.com/KONDE-AT/maechtekongresse/archive/refs/heads/master.zip
unzip master
mv maechtekongresse-master/data/editions ./data/editions
mv maechtekongresse-master/data/indices ./data/indices
mv maechtekongresse-master/data/meta ./data/meta

./dl_imprint.sh
rm -rf maechtekongresse-master && rm master.zip

# echo "create calendar data"
# python make_calendar_data.py

denormalize-indices -x './/tei:title[@type="main"]/text()' -i './data/indices/list*.xml' -f './data/editions/*.xml'