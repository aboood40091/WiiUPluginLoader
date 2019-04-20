FROM wups/core:latest

# clear portlibs. just in case.
RUN rm -rf $DEVKITPRO/portlibs

# Get dependencies
COPY --from=wiiulegacy/dynamic_libs:0.1 /artifacts $DEVKITPRO/portlibs
COPY --from=wiiulegacy/libiosuhax:0.3 /artifacts $DEVKITPRO/portlibs
COPY --from=wiiulegacy/libfat:1.1.3a /artifacts $DEVKITPRO/portlibs
COPY --from=wiiulegacy/libntfs:2013.1.13 /artifacts $DEVKITPRO/portlibs
COPY --from=wiiulegacy/libutils:0.1 /artifacts $DEVKITPRO/portlibs
COPY --from=wiiulegacy/libgui:0.1 /artifacts $DEVKITPRO/portlibs

RUN wget https://github.com/aboood40091/WiiUPluginLoader/raw/master/libs/portlibs.zip && \
	7z x -y portlibs.zip -o${DEVKITPRO} && \
	rm portlibs.zip
	
WORKDIR project