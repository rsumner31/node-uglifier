fun2=require("./rootDependency").theNonTrivialFunction();
fun=require("./rootDependency").theNonTrivialFunction("blabla");

_ = require('underscore')
sugar = require('sugar')
C=require("./depa/constants")
cryptoLoc=require("./depb/cryptoLoc.js")
rootDependency=require("./rootDependency")
crypto	= require('crypto')
#test it with new as well, same as calling require here
deepModule=new require('./depb/depDeep/deepModule')
SomeClass=new (require('./depc/SomeClass'))("test1")
SomeClass2=new require('./depc/SomeClass2')

if fun!="ROOT_TEST_blabla"
    throw new Error("ups did not work we got: " + fun + "  instead of ROOT_TEST_blabla")


dynamicFileName='./depDynamic/filename_used_in_dynamic_require'
if GLOBAL._loadDynamic
  dynamicImport=require(dynamicFileName)
#  if !_.isEqual(dynamicImport.a,"test")
#    throw new Error("ups did not work we got: " + dynamicImport.a + "  instead test ")



#calculate the sha1 of the encrypted message from constants
message=cryptoLoc.dec(cryptoLoc.enc(C.PART_A + C.PART_B,"secret"),"secret")
shasum = crypto.createHash('sha1')

r=shasum.update(message).digest("hex")
console.log(rootDependency.theNonTrivialFunction(r))

emptyString=""

if !_.isEqual(rootDependency.theNonTrivialFunction(r),"ROOT_TEST_6af9b2faa8ae8e408decd4f7121888af71597a90")
  throw new Error("ups did not work we got: " + rootDependency.theNonTrivialFunction(r) + "  instead")

if !_.isEqual(deepModule.boothDeepAndShalow(r),deepModule.boothDeepAndShalow("6af9b2faa8ae8e408decd4f7121888af71597a90"))
  throw new Error("ups did not work we got: " + r + "  instead")

if !_.isEqual(SomeClass.get(),"test1")
  throw new Error("ups did not work we got: " + SomeClass.get() + "  instead test1 ")

if !_.isEqual((new SomeClass2("test2").get()) + emptyString,"test2")
  throw new Error("ups did not work we got: " + (new SomeClass2("test2").get() + "  instead test2 "))







