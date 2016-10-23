<b><h1>whmJSON</h1></b>
<br>

<a href="mailto:tyler.r.burnam.19@dartmouth.edu?SUBJECT=About%20whmJSON"><img src="https://img.shields.io/badge/email-tyler.r.burnam.19@dartmouth.edu-blue.svg?style=flat" alt="eMail" data-canonical-src="https://img.shields.io/badge/email-tyler.r.burnam.19@dartmouth.edu-blue.svg?style=flat" style="max-width:100%;"></a> <a href="https://www.linkedin.com/in/tylerburnam"><img src="https://img.shields.io/badge/LinkedIn-Tyler%20Burnam-blue.svg?style=flat" alt="eMail" data-canonical-src="https://img.shields.io/badge/LinkedIn-Tyler%20Burnam-blue.svg?style=flat" style="max-width:100%;"></a>



<p><code>whmJSON</code> is an open source JSON library for <b>Swift 3+</b>. It currently supports serialization/deserialization for any object with primitive properties. Full support coming soon.</p>

<b>Install Instructions</b>
<br>
Drag the <code><a href=https://github.com/tburnam/whmJSON/blob/master/whmJSON/whmJSON.swift>whmJSON.swift</a></code> file to your XCode project.
<br>
<br>
<b>Usage Instructions</b>
<br>
To <u>serialize</u> an object, just call <code>whmJSON.Serialize(object: <b>yourObject</b>)</code>
<br>
This will return a <code>data</code> object that you can cast to a string or send directly to an HTTP post.
<br>
<br>
To <u>deserialize</u> into an object, just call <code>var deserializedObjects: [<b>myObjectType</b>] = whmJSON.Deserializep&#60;<b>myObjectType</b>&#62;(data: <b>yourData</b>)</code>
<br>
This will return a <code>list</code> of your objects from the JSON (if you have a single JSON string, still pass it as a list with 1 element)
<br>
<br>
Under active development
<br>
Please feel free to help
