ROLES := staff speaker listener
DITA := ./tools/dita.sh

.PHONY: all doctor validate html pdf clean

all: validate html pdf

doctor:
	@$(DITA) version

validate:
	@set -e; for role in $(ROLES); do \
		echo "Validating $$role..."; \
		$(DITA) validate -i "dita/maps/$$role.ditamap" --outer.control=quiet; \
	done

html:
	@set -e; for role in $(ROLES); do \
		echo "Building HTML5 for $$role..."; \
		$(DITA) -i "dita/maps/$$role.ditamap" -f html5 -o "build/html/$$role" --outer.control=quiet; \
	done

pdf:
	@set -e; for role in $(ROLES); do \
		echo "Building PDF for $$role..."; \
		$(DITA) -i "dita/maps/$$role.ditamap" -f pdf2 -o "build/pdf/$$role" --outer.control=quiet; \
	done

clean:
	@find build -mindepth 1 -maxdepth 1 -exec rm -rf {} +
