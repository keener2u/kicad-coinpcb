FROM productize/kicad
RUN apt-get update
RUN apt-get install -y git
RUN git clone https://github.com/keener2u/CoinPCB
#ENTRYPOINT kicad
