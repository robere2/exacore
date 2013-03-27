avspipe_avpinput_decklink_OBJECTS = \
	$(common_OBJECTS) \
	$(raw_frame_OBJECTS) \
	$(drivers_decklink_OBJECTS) \
	$(thread_OBJECTS) \
        $(graphics_OBJECTS) \
	avspipe/avpinput_decklink.o

avspipe/avpinput_decklink: $(avspipe_avpinput_decklink_OBJECTS)
	$(CXX) $(LDFLAGS) -o $@ $^ $(drivers_decklink_LIBS) $(common_LIBS) $(raw_frame_LIBS) $(graphics_LIBS)

all_TARGETS += avspipe/avpinput_decklink    

avspipe_avpinput_decklink_mjpeg_OBJECTS = \
	$(common_OBJECTS) \
	$(raw_frame_OBJECTS) \
	$(drivers_decklink_OBJECTS) \
        $(mjpeg_OBJECTS) \
	$(thread_OBJECTS) \
	avspipe/avpinput_decklink_mjpeg.o

avspipe/avpinput_decklink_mjpeg: $(avspipe_avpinput_decklink_mjpeg_OBJECTS)
	$(CXX) $(LDFLAGS) -o $@ $^ $(drivers_decklink_LIBS) $(common_LIBS) $(raw_frame_LIBS) $(graphics_LIBS) $(mjpeg_LIBS)

all_TARGETS += avspipe/avpinput_decklink_mjpeg

