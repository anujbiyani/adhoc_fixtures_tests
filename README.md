# `AdhocFixtures` Test Pollution Demonstration

Each spec file demonstrates something important to `AdhocFixtures`:

| spec file | purpose |
|---|---|
| [before_all_spec.rb](./spec/lib/before_all_spec.rb) | The intended way to use `AdhocFixtures.load` |
| [before_each_spec.rb](./spec/lib/before_each_spec.rb) | How `before(:each)` creates test pollution |
| [destroying_works_in_before_each_spec.rb](./spec/lib/destroying_works_in_before_each_spec.rb) | You can use `Class.destroy_all`, but only in a `before(:each)` |
| [pollution_from_before_all_spec.rb](./spec/lib/pollution_from_before_all_spec.rb) | Even though this is the intended use case, it still creates test pollution |
