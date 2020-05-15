cars = QueryNew("make,model",
	"cf_sql_varchar,cf_sql_varchar",
	[["Ford", "T"],["Dodge","30"]]);
for (car in cars) {
	WriteOutput("Model " & car.model);
}

//OUTPUTS Model TModel 30
