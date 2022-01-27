## App/project Description
*Bridge the Gap* (BTG) in AA is a program where a prospective member being
released from an institution (Treatment Center, Jail, Prison, etc.) is put
in contact with an AA member who has committed to help meet a person (often 
at a meeting) and offer to introduce him/her to the fellowship. 

"The Gap" comes from experience where, once a person has been released, many people
never actually make it to that 1<sup>st</sup> meeting and thus a member
may help "bridge" that gap (between the institution and the fellowship)
which might help insure their initial success.

The member providing the bridge 
has generally not committed to anything other than just
helping them find a meeting, meet them and introduce them around, answer
questions, and
generally just provide a welcoming introduction to the fellowship. They
are not obligated to transportation, financial or other assistance, or
sponsorship based on volunteering to be available for the BTG contact.

More information about this program in general can be found at [btgww.org]() 
which also advertises an annual conference in support of those that
facilitate this program across the US.

This app was originally created by Cheri Jones. It was originally designed
to maintain a list of volunteers, their location and availability and
rudimentary CRUD administrative functionality.
### Development Environment
- existing ColdFusion base tied to a lucee CFM interpreter in a
separate container/base
   - data stored in an SQL database that can be used either with CF or with
subsequent ports of the app
- create a new app in PHP which uses the same database
- prove that new code matches existing functionality
### Overview
1. Create a "dummy" app that mimics the existing functionality
2. Create a port (presuming PHP) of the basic functionality of the existing CF
code
   - would just be a CF tag -> PHP re-mapping hack to account for all loose ends
of interface and data
3. Clean up this port and make it a modern OO design
   - MVC patterns
4. Bring that more modern design into a framework (TBD) or frameworks
5. Verify/document restful 
6. Look for future opportunities to evolve this project into something
useful for the fellowship
