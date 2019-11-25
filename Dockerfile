FROM productize/kicad
RUN apt-get update
RUN apt-get install -y git
RUN mkdir /opt/kicadlibs
WORKDIR /opt/kicadlibs
RUN git clone https://github.com/Digi-Key/digikey-kicad-library.git
RUN git clone https://github.com/KiCad/kicad-symbols.git
RUN git clone https://github.com/KiCad/kicad-footprints.git
RUN ln -s /opt/kicadlibs/kicad-symbols /usr/share/kicad/library
RUN ln -s /opt/kicadlibs/kicad-footprint /usr/share/kicad/modules
WORKDIR /opt
RUN git clone https://github.com/keener2u/CoinPCB
RUN useradd -c 'kicaduser' -m -d /home/kicaduser -s /bin/bash kicaduser
RUN chown -R kicaduser.kicaduser /opt
USER kicaduser
ENV HOME /home/kicaduser
ENV KISYSMOD /opt/kicadlibs/kicad-footprints
ENV KICAD_SYMBOL_DIR /opt/kicadlibs/kicad-symbols
ENV KISYS3DMOD /opt/kicadlibs/kicad-packages3D
RUN mkdir /home/kicaduser/.config
RUN mkdir /home/kicaduser/.config/kicad
WORKDIR /home/kicaduser/.config/kicad
RUN cp /opt/kicadlibs/kicad-symbols/sym-lib-table sym-lib-table
RUN cp /opt/kicadlibs/kicad-footprints/fp-lib-table fp-lib-table
WORKDIR /opt/CoinPCB
ENTRYPOINT kicad coinPCB.pro
