importClass(Packages.ij.IJ)
importClass(Packages.java.io.File)
importClass(Packages.java.lang.System)
importClass(Packages.org.scijava.util.DigestUtils)
importClass(Packages.org.scijava.util.FileUtils)

function require(updateSite) {
	ijRoot = IJ.getDirectory("imagej");
	libDir = new File(ijRoot, "lib");
	modeFile = new File(libDir, updateSite);
	if (!modeFile.exists()) {
		IJ.error(
			"Please enable the " + updateSite + " update site.\n" +
			"Otherwise, some things will not work correctly.\n\n" +
			"You can launch the Updater via Help > Update...\n" +
			"Then click the \"Manage update sites\" dialog.");
	}
}

if (!"true".equals(System.getProperty("java.awt.headless"))) {
	javaVersion = System.getProperty("java.version");
	if (javaVersion.startsWith("1.6.")) require("Fiji-Legacy");
	else if (javaVersion.startsWith("1.7.")) {
		IJ.error(
			"-----------------------------------------------------------\n" +
			"Java version '" + javaVersion + "' is unsupported.\n" +
			"You may experience problems. See this page for guidance:\n" +
			"\n" +
			"    https://imagej.net/Java_8\n" +
			"\n" +
			"If you need assistance, please write to the Image.sc Forum:\n" +
			"\n" +
			"    https://forum.image.sc/tag/imagej\n" +
			"-----------------------------------------------------------");
	}
	else require("Java-8");
}

null
