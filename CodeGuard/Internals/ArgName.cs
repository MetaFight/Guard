namespace Seterlund.CodeGuard.Internals
{
    public class ArgName
    {
        public virtual string Value { get; set; }

        public static implicit operator string(ArgName argName)
        {
            return argName.Value;
        }
    }
}