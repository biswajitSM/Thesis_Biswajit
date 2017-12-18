# Thesis_Biswajit
Thesis as a requirement for the fulfillment of PhD in Leiden University 

To generate the pdf manuscript run the following codes in sequence:

	make svgtopdf #to convert all svg files to pdf
	make
The first command converts the svg files to pdf. This requires Python and Inkscape installed.
To clean the auxillary files:

	make clean
if bibliography is missing some references, use following  command to create new bibliography by combining individual bib files from chpaters.
		
		make bib-combine #combine individual 
