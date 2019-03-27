import closure_methods
import strformat

class(Base):
  ctor(newBase)
  let s = "base"
  proc id*(): string = s

classOf(Sub, Base):
  ctor(newSub)
  base()
  let s = "sub"
  proc id*(): string = &"{base.id()}.{s}"

classOf(SubSub, Sub):
  ctor(newSubSub)
  base()
  let s = "subsub"
  proc id*(): string = &"{base.id()}.{s}"

block:
  let a = newBase()
  let b = newSub()
  let c = newSubSub()
  echo a.id()
  echo b.id()
  echo c.id()
  doAssert a.id() == "base"
  doAssert b.id() == "base.sub"
  doAssert c.id() == "base.sub.subsub"
