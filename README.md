<b><h1>whmJSON</h1></b>
<br>
<p><code>whmJSON</code> is an open source JSON library for <b>Swift 3+</b>. It currently supports serialization/deserialization for any object with primitive properties. Full support coming soon.</p>

<b>Install Instructions</b>
<br>
Drag the <code>whmJSON.swift</code> file to your XCode project.
<br>
<br>
<b>Usage Instructions</b>
<br>
To serialize an object, just call <code>whmJSON.Serialize(object: <b>yourObject</b>)</code>
<br>
This will return a <code>data</code> object that you can cast to a string or send directly to an HTTP post.
<br>
<br>
To deserialize into an object, just call <code>var deserializedObjects: [<b>myObjectType</b>] = whmJSON.Deserializep&#60;<b>myObjectType</b>&#62;(data: <b>yourData</b>)</code>
<br>
This will return a <code>list</code> of your objects from the JSON (if you have a single JSON string, still pass it as a list with 1 element)
<br>
<br>
Under active development
<br>
Please feel free to help
