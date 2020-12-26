CREATE PROCEDURE [dbo].[GetAllRules]
	@paramName [nvarchar](256),
	@paramNormalizedName [nvarchar](256)
AS
BEGIN
	SELECT 
		[Name]
		[NormalizedName]
	FROM
		[dbo].[AspNetRoles] WITH (NOLOCK)
	WHERE 
		[Name] = @paramName AND
		[NormalizedName] = @paramNormalizedName
END