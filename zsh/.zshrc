## 起動時にworkに移動 ##
if [ -e $HOME/work ]; then
	# workが存在すれば移動する
	cd $HOME/work
else
    # workがなければ作ってから移動する
	mkdir $HOME/work && cd $HOME/work
fi
