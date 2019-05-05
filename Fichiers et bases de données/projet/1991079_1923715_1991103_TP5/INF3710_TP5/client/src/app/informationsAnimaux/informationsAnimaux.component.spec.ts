import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { InformationsAnimauxComponent } from './informationsAnimaux.component';

describe('InformationsAnimauxComponent', () => {
  let component: InformationsAnimauxComponent;
  let fixture: ComponentFixture<InformationsAnimauxComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ InformationsAnimauxComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(InformationsAnimauxComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
