## whmJSON

I wrote this library back when I used to think that md files only took HTML (see this readme's source) and had no idea that CocoaPods existed. CocoaPods very much existed and markdown is like this whole thing, so please, if you are in search of a JSON serializer, visit: [SwiftyJSON](https://github.com/SwiftyJSON/SwiftyJSON)

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
To <u>deserialize</u> into an object, just call <code>var deserializedObjects: [<b>myObjectType</b>] = whmJSON.Deserialize(data: <b>yourData</b>)</code>
<br>
This will return a <code>list</code> of your objects from the JSON (if you have a single JSON string, still pass it as a list with 1 element)
<br>
<br>
<del>Under active development</del>
<br>
Please feel free to help
