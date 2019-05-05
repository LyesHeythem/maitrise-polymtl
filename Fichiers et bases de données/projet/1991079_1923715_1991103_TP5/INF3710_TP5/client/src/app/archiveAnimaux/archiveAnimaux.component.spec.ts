import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ArchiveAnimauxComponent } from './archiveAnimaux.component';

describe('ArchiveAnimauxComponent', () => {
  let component: ArchiveAnimauxComponent;
  let fixture: ComponentFixture<ArchiveAnimauxComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ArchiveAnimauxComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ArchiveAnimauxComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
