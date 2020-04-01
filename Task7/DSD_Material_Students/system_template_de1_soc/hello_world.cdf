/* Quartus Prime Version 19.1.0 Build 670 09/22/2019 SJ Standard Edition */
JedecChain;
	FileRevision(JESD32A);
	DefaultMfr(6E);

	P ActionCode(Ign)
		Device PartName(SOCVHPS) MfrSpec(OpMask(0));
	P ActionCode(Cfg)
		Device PartName(5CSEMA5F31) Path("C:/Users/Timo Thans/Documents/Minor Imperial/Digital_System_Design/Task7/DSD_Material_Students/system_template_de1_soc/") File("hello_world.sof") MfrSpec(OpMask(1));

ChainEnd;

AlteraBegin;
	ChainType(JTAG);
AlteraEnd;
