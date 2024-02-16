var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();

app.MapGet("/", () => "Hello World, from Aditi....We are successful... my web hook is successful");

app.Run();
