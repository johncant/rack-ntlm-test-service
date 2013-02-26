# rack-ntlm-test-service

Test that your HTTP client supports NTLM authentication.

## Usage

Rack middleware: <pre>Rack::Ntlm</pre>

Arguments:

<pre>
{   
  :uri_pattern => /\/login/,
  :auth => {
    :username => 'user',
    :password => 'secret'
  }
}
</pre>


# Credit to dtsato and lukefx for the original rack-ntlm gem on which this is based.

<h1>Temporary word of caution</h1>

<p>until my changes have been merged and pushed, you need to use the 'rubyntlm' gem from my github.</p>

<a href="https://github.com/johncant/rubyntlm">https://github.com/johncant/rubyntlm</a>
