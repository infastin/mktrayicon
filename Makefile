PREFIX ?= /usr/local
CC ?= cc

output: mktrayicon.c
	${CC} `pkg-config --cflags gtk+-3.0` -o mktrayicon $< `pkg-config --libs gtk+-3.0` `pkg-config --cflags --libs x11`

install: output
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	install -m 0755 mktrayicon $(DESTDIR)$(PREFIX)/bin/mktrayicon

clean:
	rm -f *.o mktrayicon

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/mktrayicon
