# Install Ubby

install-core:
	install -dm755 $(DESTDIR)/usr/bin/
	install -dm755 $(DESTDIR)/usr/share/ubby/

	for f in *; do [[ $$f != "plugins" ]] && cp -pr $$f $(DESTDIR)/usr/share/ubby/; done

	install -Dpm 0755 ubby.exec $(DESTDIR)/usr/bin/ubby

	install -Dpm 0644 ubby.desktop $(DESTDIR)/usr/share/applications/org.modulo.ubby.desktop
	install -Dpm 0644 ubby.appdata.xml $(DESTDIR)/usr/share/appdata/ubby.appdata.xml

	install -Dpm 0644 ubby.svg $(DESTDIR)/usr/share/icons/hicolor/scalable/apps/ubby.svg
	install -Dpm 0644 ubby-symbolic.svg $(DESTDIR)/usr/share/icons/hicolor/scalable/apps/ubby-symbolic.svg

	install -Dpm 0644 run-as-root.policy $(DESTDIR)/usr/share/polkit-1/actions/org.modulo.pkexec.run-as-root.policy

	@-if test -z $(DESTDIR); then gtk-update-icon-cache -f -t $(DESTDIR)/usr/share/icons/hicolor; fi


install-plugins:
	install -dm755 $(DESTDIR)/usr/share/ubby/plugins

	cp -pr plugins/* $(DESTDIR)/usr/share/ubby/plugins/


install: install-core install-plugins


uninstall:
	rm -rf $(DESTDIR)/usr/share/ubby/

	rm -f $(DESTDIR)/usr/bin/ubby

	rm -f $(DESTDIR)/usr/share/applications/org.modulo.ubby.desktop
	rm -f $(DESTDIR)/usr/share/appdata/ubby.appdata.xml

	rm -f $(DESTDIR)/usr/share/icons/hicolor/scalable/apps/ubby.svg
	rm -f $(DESTDIR)/usr/share/icons/hicolor/scalable/apps/ubby-symbolic.svg

	rm -f $(DESTDIR)/usr/share/polkit-1/actions/org.modulo.pkexec.run-as-root.policy

	@-if test -z $(DESTDIR); then gtk-update-icon-cache -f -t $(DESTDIR)/usr/share/icons/hicolor; fi
