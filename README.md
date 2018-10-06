# PostsecAPI

This is a proof of concept for an API to search accredited post secondary institutions in the US. I once needed this for a project and thought it would work well as a standalone API.

There is a [sample autocomplete](https://postsecapisample.netlify.com) ([view source](https://github.com/perezperret/postsec_api_sample)) using the API, and you can [hit the api](http://postsecapi.herokuapp.com).

The data was obtained from the [IPEDS database](https://nces.ed.gov/ipeds/use-the-data)

On the other hand, I wanted to try out the [crystal programming language](https://crystal-lang.org/) and the [Lucky web framework](https://luckyframework.org), and this looked like a nice fit.

## Usage

It's a single endpoint API, at `/institutions`.

### Options
Only three options (passed in as query params) are supported for the time being:
1. `page`: optional, defaults to `1`.
1. `per_page`: optional, defaults to `20`.
1. `query`: optional, searches the names of the institutions.

### Example
```javascript
  fetch("postsecapi.herokuapp.com/institutions?page=1&per_page=1")
  .then(response => response.json())
  .then(responseJson => console.log(responseJson))

  // = { "ipeds_id": "166027", "name": "Harvard University" }
```
For a more complete example, check out [the sample app](https://github.com/perezperret/postsec_api_sample).

## Running the project locally

1. [Install required dependencies](http://luckyframework.org/guides/installing.html#install-required-dependencies)
1. Run `bin/setup`
1. Run `lucky dev` to start the app
1. Set up the database running `lucky db.create` and then `lucky db.migrate`
1. Load the database seeds running `lucky db.create_required_seeds`

## Improvements
This is just a proof of concept and I don't intend to invest much time in it unless I find a need for it again. But here are a few ideas of what can be improved, and of course PRs would be more than welcome.
- [ ] Use the IPEDS database better
  - [ ] Expose more information, for instance it would be nice to include location data.
  - [ ] Use more fields in search, for instance, the `name alias` field in the IPEDS database could help easily improve the search
- [ ] Use Postgres better (Currently a simple `ilike` query is being used, but the full text search and trigram module could greatly improve the results)
- [ ] Make production ready (I think this could be a useful service and mantained very cheaply if the previous points are addressed, and API keys are added, but I think it would make more sense to port to a more mature framework)

## Learn Lucky

This app uses Lucky, which in turn uses the [Crystal](https://crystal-lang.org) programming language. You can learn about Lucky from the [Lucky Guides](http://luckyframework.org/guides).
