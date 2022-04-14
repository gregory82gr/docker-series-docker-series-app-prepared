FROM mcr.microsoft.com/dotnet/core/sdk:3.1

WORKDIR /home/app

COPY . .

RUN dotnet test ./Tests/Tests.csproj

RUN dotnet restore

RUN dotnet publish ./AccountOwnerServer/AccountOwnerServer.csproj -o /publish/

WORKDIR /publish

ENV ASPNETCORE_URLS="http://0.0.0.0:5000"

ENTRYPOINT ["dotnet", "AccountOwnerServer.dll"]