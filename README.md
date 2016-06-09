see: http://mrrrgn.com/date

`Date.parse` has been breaking cross-engine compatibility for over a decade now, and it's easy to see why when reading the spec:

`20.3.3.2`:

    "The function first attempts to parse the format of the String according to the rules 
    (including extended years) called out in Date Time String Format (20.3.1.16). If the 
    String does not conform to that format the function may fall back to any 
    implementation-specific heuristics or implementation-specific date formats."
    


Developers have a reasonable expectation that their code should work across implementations. Breaking this assumption with heuristics leads to confusion: "always use ISO 8601 format dates in `new Date(...)` or it won't work across browsers" is a gotcha. It has created a situation where the most popular engine's parser becomes the de facto standard and everyone else is left to play catch up.

Custom behavior belongs in libraries like Moment.js not in VMs, which should provide stability and consistency. The good news is, while things are breaking, most implementations aren't extremely different. It seems that a reasonable grammar could be made which is [at least almost] a superset of their individual quirks. 

This repository contains that grammar (a work in progress). Once sussed out, it will be used to propose a change to `Date.parse` in the JavaScript specification.
