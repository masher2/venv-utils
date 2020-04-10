PREFIX=/usr/local

install:
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp -f actenv $(DESTDIR)$(PREFIX)/bin/actenv
	cp -f createnv $(DESTDIR)$(PREFIX)/bin/createnv
	cp -f installreqs $(DESTDIR)$(PREFIX)/bin/installreqs
	cp -f deletenv $(DESTDIR)$(PREFIX)/bin/deletenv

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/actenv
	rm -f $(DESTDIR)$(PREFIX)/bin/createnv
	rm -f $(DESTDIR)$(PREFIX)/bin/installreqs
	rm -f $(DESTDIR)$(PREFIX)/bin/deletenv
