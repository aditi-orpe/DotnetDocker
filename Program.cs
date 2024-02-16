var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();

app.MapGet("/", () => "Hello World, from Aditi....We are successful... Finally ..My web hook is successful");

app.Run();
