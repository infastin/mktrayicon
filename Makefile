PREFIX ?= /usr/local
CC ?= cc

mktrayicon: mktrayicon.c
	${CC} `pkg-config --cflags gtk+-3.0` -o $@ $< `pkg-config --libs gtk+-3.0` `pkg-config --cflags --libs x11`

install: mktrayicon
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	install -m 0755 $< $(DESTDIR)$(PREFIX)/bin/mktrayicon

clean:
	rm -f *.o mktrayicon

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/mktrayicon
