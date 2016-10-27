namespace Tmpi.Pyrene.ServiceModel
{
    /// <summary>
    /// http://swagger.io/specification/
    /// </summary>
    internal static class SwaggerParamTypes
    {
        /// <summary>
        /// Used together with Path Templating, where the parameter value is actually part of the operation's URL.
        /// </summary>
        public const string Path = "path";

        /// <summary>
        /// Parameters that are appended to the URL.
        /// </summary>
        public const string Query = "query";

        /// <summary>
        /// Custom headers that are expected as part of the request.
        /// </summary>
        public const string Header = "header";

        /// <summary>
        /// The payload that's appended to the HTTP request.
        /// </summary>
        public const string Body = "body";

        /// <summary>
        /// Used to describe the payload of an HTTP request when either application/x-www-form-urlencoded, 
        /// multipart/form-data or both are used as the content type of the request.
        /// </summary>
        public const string Form = "form";
    }
}
