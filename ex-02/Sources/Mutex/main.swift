private func pre(p: Place, t: Transition) -> Nat {
  switch (p, t) {
  case (Place("c"), Transition("t0")): return 1
  case (Place("s0"), Transition("t0")): return 1
  case (Place("s4"), Transition("t0")): return 1
  case (Place("s1"), Transition("t1")): return 1
  case (Place("s2"), Transition("t2")): return 1
  case (Place("s4"), Transition("t2")): return 1
  case (Place("b"), Transition("t2")): return 1
  case (Place("s2"), Transition("t1")): return 1
  default: return 0
  }
}

private func post(p: Place, t: Transition) -> Nat {
  switch (p, t) {
  case (Place("p1"), Transition("t1")): return 5
  case (Place("p1"), Transition("t2")): return 0
  case (Place("p1"), Transition("t3")): return 1
  case (Place("p2"), Transition("t1")): return 7
  case (Place("p2"), Transition("t2")): return 3
  case (Place("p2"), Transition("t3")): return 0
  default: return 0
  }
}

func initialMarking(_ place: Place) -> Nat {
  switch place {
  case Place("p1"): return 2
  case Place("p2"): return 3
  default: return 0
  }
}

let model = PetriNet(
  places     : [Place("b"), Place("c"), Place("s0"), Place("s1"), Place("s2"), Place("s3"), Place("s4")],
  transitions: [Transition("t0"),Transition("t1"), Transition("t2"), Transition("t3")],
  pre        : pre,
  post       : post)


let c  = model.incidenceMatrix
let s  = model.characteristicVector(of: [Transition("t1"), Transition("t2"), Transition("t1")])
let m0 = model.markingVector(initialMarking)
let m1 = m0 + c * s

print(m0, m1)
