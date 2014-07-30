# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'cucumber', bundler: false do
  watch(%r{^features/.+\.feature$})
  watch(%r{^features/support/.+$})              { 'features' }
  watch(%r{^bin/.+$})                           { 'features' }
  watch(%r{^features/step_definitions/.+\.rb$}) { 'features' }
end
