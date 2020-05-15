struct = StructNew();
struct.one = "1";
struct.two = "2";
for (key in struct) {
	WriteOutput(key);
}

//OUTPUTS onetwo
